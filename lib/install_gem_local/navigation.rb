module InstallGemLocal
  class Navigation
    class << self
      def start
        options = {
          "a" => {"value" => 'remove', "display" => 'Remove old version'},
          "b" => {"value" => 'build', "display" => 'Build new version'},
          "c" => {"value" => 'install', "display" => 'Install new version'},
          "d" => {"value" => 'aoa', "display" => 'Remove old version, build and install the new version'},
          "/" => {"value" => "exit", "display" => "Exit"}
        }

        selection = Downup::Base.new(flash_message: 'Select Action', options: options).prompt

        ap selection

        case selection
        when 'remove'
          InstallGemLocal::Action.remove_gem
        when 'build'
          InstallGemLocal::Action.build_gem
        when 'install'
          InstallGemLocal::Action.install_gem
        when 'aoa'
          InstallGemLocal::Action.aoa
        end
      end
    end
  end
end