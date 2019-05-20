# frozen_string_literal: true

require 'thor'
require 'downup'
require 'awesome_print'
require 'tty-command'

require 'install_gem_local/action/install_gem'
require 'install_gem_local/action/build_gem'
require 'install_gem_local/action/remove_gem'
require 'install_gem_local/action/copy_gem'
require 'install_gem_local/action/push_gem'
Dir[File.join(File.expand_path(__dir__), 'install_gem_local', '**/*.rb')].each { |f| require f }

module InstallGemLocal
  class App < Thor
    desc 'usage', 'list all commands'
    def usage; end
  end
end
