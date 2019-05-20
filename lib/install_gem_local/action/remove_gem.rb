module InstallGemLocal
  module RemoveGem
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
  end
end
