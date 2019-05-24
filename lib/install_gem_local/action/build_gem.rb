# frozen_string_literal: true

module InstallGemLocal
  module BuildGem
    def build_gem
      puts ''
      puts I18n.t('action.build_gem.puts_line').green
      file = tty_command.run('find -type f -name "*.gemspec"')
      file_name = file.out.strip
      file_name.empty? ? ap(I18n.t(:gemspec_not_exist)) : tty_command.run("gem build #{file_name}")
    end
  end
end
