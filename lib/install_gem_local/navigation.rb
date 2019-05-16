# frozen_string_literal: true

module InstallGemLocal
  class Navigation
    class << self
      def start
        options = {
          'a' => { 'value' => 'remove', 'display' => 'Remove old version' },
          'b' => { 'value' => 'build', 'display' => 'Build new version' },
          'c' => { 'value' => 'install', 'display' => 'Install new version' },
          'd' => { 'value' => 'copy_gem', 'display' => 'Copy gem to folder' },
          'e' => { 'value' => 'till_install', 'display' => 'Remove old version, build and install the new version' },
          'f' => { 'value' => 'till_copy', 'display' => 'Remove old version, build, install and copy the new version' },
          '/' => { 'value' => 'exit', 'display' => 'Exit' }
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
        when 'copy_gem'
          InstallGemLocal::Action.copy_gem
        when 'till_install'
          InstallGemLocal::Action.till_install
        when 'till_copy'
          InstallGemLocal::Action.till_copy
        end
      rescue StandardError => e
        ap e
        ap 'Something Wrong! Try again!'
      end
    end
  end
end
