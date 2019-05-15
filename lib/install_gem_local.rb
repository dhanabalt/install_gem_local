# frozen_string_literal: true

require 'install_gem_local/version'

module InstallGemLocal
  class App < Thor
    desc 'usage, list all commands'
    def usage
      puts 'all commands'
    end
  end
end
