# frozen_string_literal: true
require 'thor'
require 'install_gem_local/version'
require 'downup'
require 'install_gem_local/navigation'

module InstallGemLocal
  class App < Thor
    desc 'usage', 'list all commands'
    def usage

    end
  end
end
