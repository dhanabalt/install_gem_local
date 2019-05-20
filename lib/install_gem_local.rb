# frozen_string_literal: true

require 'thor'
require 'downup'
require 'awesome_print'
require 'tty-command'

Dir[File.join(File.expand_path("..",__FILE__), 'install_gem_local', '**/*.rb')].each {|f| require f}

module InstallGemLocal
  class App < Thor
    desc 'usage', 'list all commands'
    def usage; end
  end
end
