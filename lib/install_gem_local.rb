# frozen_string_literal: true
require 'thor'
require 'downup'
require 'awesome_print'
require 'tty-command'

require 'install_gem_local/version'
require 'install_gem_local/navigation'
require 'install_gem_local/action'

module InstallGemLocal
  class App < Thor
    desc 'usage', 'list all commands'
    def usage

    end
  end
end
