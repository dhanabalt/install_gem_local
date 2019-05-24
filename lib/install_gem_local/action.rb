# frozen_string_literal: true

module InstallGemLocal
  class Action
    extend InstallGemLocal::InstallGem
    extend InstallGemLocal::CopyGem
    extend InstallGemLocal::RemoveGem
    extend InstallGemLocal::BuildGem
    extend InstallGemLocal::PushGem

    class << self
      def till_install
        remove_gem
        build_gem
        install_gem
      end

      def till_copy
        till_install
        copy_gem
      end

      private

      def tty_command
        @tty_command ||= TTY::Command.new(uuid: false, printer: :quiet)
      end

      def file_names
        file = tty_command.run('find -type f -name "*.gem"')
        file.entries
      end

      def multiple_version_selection(include_all: false)
        options =
          include_all ? { '*' => { 'value' => 'all', 'display' => 'All Versions' } } : {}
        file_names.each_with_index do |file_name, index|
          options[('a'..'z').to_a[index]] = { 'value' => file_name, 'display' => file_name }
        end
        options['/'] = { 'value' => 'exit', 'display' => 'Exit' }
        InstallGemLocal::Helper.prompt_options(
          flash_message: InstallGemLocal::Helper.flash_message(title: 'Choose which version'),
          options: options
        )
      end
    end
  end
end
