# Be sure to restart your server when you modify this file.

# You can add backtrace silencers for libraries that you're using
# but don't wish to see in your backtraces.
# Rails.backtrace_cleaner.add_silencer { |line| line =~ /assets/ }

# You can also remove all the silencers if you're trying to debug a
# problem that might stem from framework code.
# Rails.backtrace_cleaner.remove_silencers!
#


if Rails.env.development?
  Rails.application.assets.logger = Logger.new('/dev/null')
  Rails::Rack::Logger.class_eval do
    def call_with_quiet_assets(env)
      previous_level = Rails.logger.level
      Rails.logger.level = Logger::ERROR if env['PATH_INFO'] =~ %r{^/assets/}
      call_without_quiet_assets(env)
    ensure
      Rails.logger.level = previous_level
    end
    alias_method_chain :call, :quiet_assets
  end
end
