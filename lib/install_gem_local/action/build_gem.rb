# frozen_string_literal: true

module InstallGemLocal
  module BuildGem
    def build_gem
      puts ''
      puts 'Build Gem'.green
      file = tty_command.run('find -type f -name "*.gemspec"')
      file_name = file.out.strip
      file_name.empty? ? ap('Gemspec not exist') : tty_command.run("gem build #{file_name}")
    end
  end
end
