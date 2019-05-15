module InstallGemLocal
  class Navigation
    class << self
      def start
        options = {
          a: {value: 'All activity', display: 'Remove old version, build and install the new version'},
          b: {value: 'remove', display: 'Remove old version'},
          c: {value: 'build', display: 'Build new version'},
          d: {value: 'install', display: 'Install new version'}
        }

        puts Downup::Base.new(options: options).prompt
      end
    end
  end
end