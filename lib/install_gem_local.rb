# frozen_string_literal: true

require 'thor'
require 'downup'
require 'awesome_print'
require 'tty-command'
require 'i18n'

I18n.load_path << Dir[File.expand_path('lib/locales') + '/*.yml']
I18n.config.available_locales = :en

require 'install_gem_local/action/install_gem'
require 'install_gem_local/action/build_gem'
require 'install_gem_local/action/remove_gem'
require 'install_gem_local/action/copy_gem'
require 'install_gem_local/action/push_gem'
Dir[File.join(File.expand_path(__dir__), 'install_gem_local', '**/*.rb')].each { |f| require f }

module InstallGemLocal
  class App < Thor

    desc 'methods_description', 'list all methods description'
    def methods_desc
      puts InstallGemLocal::Utilization.show_methods
    end
  end
end
