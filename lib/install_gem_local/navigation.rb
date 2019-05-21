# frozen_string_literal: true

module InstallGemLocal
  class Navigation
    class << self
      def start
        options = {
          'a' => { 'value' => 'remove_gem', 'display' => 'Remove old version' },
          'b' => { 'value' => 'build_gem', 'display' => 'Build new version' },
          'c' => { 'value' => 'install_gem', 'display' => 'Install new version' },
          'd' => { 'value' => 'copy_gem', 'display' => 'Copy gem to folder' },
          'e' => { 'value' => 'push_gem', 'display' => 'Build the latest version and push the gem' },
          'f' => { 'value' => 'till_install', 'display' => 'Remove old version, build and install the new version' },
          'g' => { 'value' => 'till_copy', 'display' => 'Remove old version, build, install and copy the new version' },
          '/' => { 'value' => 'exit', 'display' => 'Exit' }
        }

        selection = InstallGemLocal::Helper.prompt_options(
          flash_message: 'Select Action',
          options: options
        )

        ap selection

        unless selection == 'exit'
          InstallGemLocal::Action.send(selection.to_sym)
          #InstallGemLocal::Navigation.start unless selection == 'exit'
        end

      rescue StandardError => e
        ap e
        ap 'Something Wrong! Try again!'
      end
    end
  end
end
