module InstallGemLocal
  class Action
    class << self
      def remove_gem
        cmd = TTY::Command.new
        file = cmd.run('find -type f -name "*.gem"')
        ap file_name = file.out.strip
        file_name.empty? ? ap('Gem not exist') : cmd.run("rm #{file_name}")

      rescue StandardError => e
        ap e
        ap 'Something Wrong! Try again!'
      end

      def build_gem
        puts '-----------------------------'
        puts ''
        cmd = TTY::Command.new
        file = cmd.run('find -type f -name "*.gemspec"')
        ap file_name = file.out.strip
        file_name.empty? ? ap('Gemspec not exist') : cmd.run("gem build #{file_name}")

      rescue StandardError => e
        ap e
        ap 'Something Wrong! Try again!'
      end

      def install_gem
        puts '-----------------------------'
        puts ''
        cmd = TTY::Command.new
        file = cmd.run('find -type f -name "*.gem"')
        ap file_name = file.out.strip
        file_name.empty? ? ap('Gem not exist') : cmd.run("gem install #{file_name}")

      rescue StandardError => e
        ap e
        ap 'Something Wrong! Try again!'
      end

      def aoa
        remove_gem
        build_gem
        install_gem
      end
    end
  end
end