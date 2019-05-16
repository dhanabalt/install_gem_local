# frozen_string_literal: true

module InstallGemLocal
  class Action
    class << self
      def remove_gem
        cmd = TTY::Command.new
        file = cmd.run('find -type f -name "*.gem"')
        ap file_name = file.out.strip
        file_name.empty? ? ap('Gem not exist') : cmd.run("rm #{file_name}")
      end

      def build_gem
        puts '-----------------------------'
        puts ''
        cmd = TTY::Command.new
        file = cmd.run('find -type f -name "*.gemspec"')
        ap file_name = file.out.strip
        file_name.empty? ? ap('Gemspec not exist') : cmd.run("gem build #{file_name}")
      end

      def install_gem
        puts '-----------------------------'
        puts ''
        cmd = TTY::Command.new
        file = cmd.run('find -type f -name "*.gem"')
        ap file_name = file.out.strip
        file_name.empty? ? ap('Gem not exist') : cmd.run("gem install #{file_name}")
      end

      def copy_gem
        options = {
          'a' => { 'value' => 'desktop', 'display' => 'Desktop' },
          'b' => { 'value' => 'downloads', 'display' => 'Downloads' },
          'c' => { 'value' => 'documents', 'display' => 'Documents' },
          '/' => { 'value' => 'exit', 'display' => 'Exit' }
        }

        selection = Downup::Base.new(flash_message: 'Choose Folder To Copy',
                                     options: options).prompt

        ap selection

        cmd = TTY::Command.new
        file = cmd.run('find -type f -name "*.gem"')
        ap file_name = file.out.strip
        if file_name.empty?
          ap 'Gem not present in the current folder'
        else
          case selection
          when 'desktop'
            cmd.run("cp #{file_name} ~/Desktop")
          when 'downloads'
            cmd.run("cp #{file_name} ~/Downloads")
          when 'documents'
            cmd.run("cp #{file_name} ~/Documents")
          end
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
