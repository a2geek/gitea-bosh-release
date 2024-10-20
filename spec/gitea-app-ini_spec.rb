require 'rspec'
require 'json'
require 'bosh/template/test'
require 'base64'

describe 'gitea job' do
  let(:release) { Bosh::Template::Test::ReleaseDir.new(File.join(File.dirname(__FILE__), '..')) }
  let(:job) { release.job('gitea') }

  describe 'app.ini' do
    let(:template) { job.template('config/app.ini') }

    # These are generated in the manifest and required by the template.
    ini_defaults = {
      "server" => {
        "domain" => "mydomain.com"
      },
      "security" => {
        "secret_key" => "secret-key",
        "internal_token" => "internal-token"
      },
      "oauth2" => {
        "jwt_secret" => "jwt-secret"
      }
    }

    it 'defaults to sqlite3' do
      config = {
        # just database defaults
      }
      ini = template.render(config.merge(ini_defaults))
      expect(ini).to include("DB_TYPE=sqlite3")
    end

    it 'can be configured for postgres' do
      config = {
        "database" => {
          "type" => "postgres",
          "host" => "postgres.gitea.local:5432",
          "name" => "gitea",
          "user" => "gitea",
          "password" => "sekret"
        }
      }
      ini = template.render(config.merge(ini_defaults))
      expect(ini).to include("DB_TYPE=postgres")
      expect(ini).to include("HOST=postgres.gitea.local:5432")
      expect(ini).to include("NAME=gitea")
      expect(ini).to include("USER=gitea")
      expect(ini).to include("PASSWD=`sekret`")
      expect(ini).to include("SCHEMA=public")
    end

    it 'can be configured for local mysql' do
      config = {
        "database" => {
          "type" => "mysql",
          "host" => "/var/run/mysqld/mysqld.sock",
          "name" => "gitea",
          "user" => "gitea",
          "password" => "sekret"
        }
      }
      ini = template.render(config.merge(ini_defaults))
      expect(ini).to include("DB_TYPE=mysql")
      expect(ini).to include("HOST=/var/run/mysqld/mysqld.sock")
      expect(ini).to include("NAME=gitea")
      expect(ini).to include("USER=gitea")
      expect(ini).to include("PASSWD=`sekret`")
    end


    it 'can be configured for remote mysql' do
      config = {
        "database" => {
          "type" => "mysql",
          "host" => "database.gitea.internal:3306",
          "name" => "gitea",
          "user" => "gitea",
          "password" => "sekret"
        }
      }
      ini = template.render(config.merge(ini_defaults))
      expect(ini).to include("DB_TYPE=mysql")
      expect(ini).to include("HOST=database.gitea.internal:3306")
      expect(ini).to include("NAME=gitea")
      expect(ini).to include("USER=gitea")
      expect(ini).to include("PASSWD=`sekret`")
    end

    it 'raises an error if the database type is unknown' do
      config = {
        "database" => {
          "type" => "unsupported-db"
        }
      }
      expect { 
        template.render(config.merge(ini_defaults)) 
      }.to raise_error("unknown database type: unsupported-db")
    end

  end
end