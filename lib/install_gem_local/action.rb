# frozen_string_literal: true

module InstallGemLocal
  class Action
    class << self
      def remove_gem
        file_exists = file_names
        if file_exists.count > 1
          remove_file_from_path(multiple_version_selection)
        elsif file_exists.count == 1
          remove_file_from_path(file_exists.first)
        else
          ap 'Gem not exist'
        end
      end

      def remove_file_from_path(file_name)
        tty_command.run("rm #{file_name}")
      end

      def build_gem
        puts '-----------------------------'
        puts ''
        file = tty_command.run('find -type f -name "*.gemspec"')
        ap file_name = file.out.strip
        file_name.empty? ? ap('Gemspec not exist') : tty_command.run("gem build #{file_name}")
      end

      def install_gem
        puts '-----------------------------'
        puts ''
        files_exists = file_names
        if files_exists.count > 1
          install_gem_from_path(multiple_version_selection)
        elsif files_exists.count == 1
          install_gem_from_path(files_exists.first)
        else
          ap 'Gem not exist'
        end
      end

      def install_gem_from_path(file_name)
        tty_command.run("gem install #{file_name}")
      end

      def multiple_version_selection
        options = {}
        file_names.each_with_index do |file_name, index|
          options[('a'..'z').to_a[index]] = { 'value' => file_name, 'display' => file_name }
        end
        options['/'] = { 'value' => 'exit', 'display' => 'Exit'}
        Downup::Base.new(flash_message: 'Choose which version',
                         options: options).prompt
      end

      def file_names
        file = tty_command.run('find -type f -name "*.gem"')
        file.entries
      end

      def tty_command
        @tty_command ||= TTY::Command.new
      end

      def choose_copy_folder
        options = {
            'a' => { 'value' => 'desktop', 'display' => 'Desktop' },
            'b' => { 'value' => 'downloads', 'display' => 'Downloads' },
            'c' => { 'value' => 'documents', 'display' => 'Documents' },
            '/' => { 'value' => 'exit', 'display' => 'Exit' }
        }

        Downup::Base.new(flash_message: 'Choose Folder To Copy',
                         options: options).prompt
      end

      def copy_gem
        files_exists = file_names

        if files_exists.count > 1
          copy_file_to_path(multiple_version_selection)
        elsif files_exists.count == 1
          copy_file_to_path(files_exists.first)
        else
          ap 'Gem not exist'
        end
      end

      def copy_file_to_path(file_name)
        case choose_copy_folder
        when 'desktop'
          tty_command.run("cp #{file_name} ~/Desktop")
        when 'downloads'
          tty_command.run("cp #{file_name} ~/Downloads")
        when 'documents'
          tty_command.run("cp #{file_name} ~/Documents")
        end
      end

      def till_install
        remove_gem
        build_gem
        install_gem
      end

      def till_copy
        till_install
        copy_gem
      end
    end
  end
end
