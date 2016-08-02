require "refile"
Refile.configure do |config|
  connection = lambda { |&blk| ActiveRecord::Base.connection_pool.with_connection { |con| blk.call(con.raw_connection) } }
  config.store = Refile::Postgres::Backend.new(connection)
end

if Rails.env.production?
  Refile.cdn_host = 'https://aqueous-chamber-43940.herokuapp.com/'
else
  Refile.cdn_host = 'http://80cf5e8f.ngrok.io'
end
