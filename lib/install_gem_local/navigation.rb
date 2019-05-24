# frozen_string_literal: true

module InstallGemLocal
  class Navigation
    class << self
      def start
        options = {
          'a' => { 'value' => 'remove_gem', 'display' => I18n.t('action.remove_gem.display') },
          'b' => { 'value' => 'build_gem', 'display' => I18n.t('action.build_gem.display') },
          'c' => { 'value' => 'install_gem', 'display' => I18n.t('action.install_gem.display') },
          'd' => { 'value' => 'copy_gem', 'display' => I18n.t('action.copy_gem.display') },
          'e' => { 'value' => 'push_gem', 'display' => I18n.t('action.push_gem.display') },
          'f' => { 'value' => 'till_install', 'display' => I18n.t('action.till_install.display') },
          'g' => { 'value' => 'till_copy', 'display' => I18n.t('action.till_copy.display') },
          '/' => { 'value' => 'exit', 'display' => 'Exit' }
        }

        selection = InstallGemLocal::Helper.prompt_options(
          flash_message: InstallGemLocal::Helper.flash_message(title: 'Select Action'),
          options: options
        )

        unless selection == 'exit'
          InstallGemLocal::Action.send(selection.to_sym)
          #InstallGemLocal::Navigation.start
        end

      rescue StandardError => e
        ap e
        ap I18n.t('something_wrong')
      end
    end
  end
end
