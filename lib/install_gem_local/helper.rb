module InstallGemLocal
  class Helper
    class << self
      def prompt_options(options:, flash_message:, color: :green, selected_color: :bold, flash_color: :green)
        Downup::Base.new(
          flash_message: flash_message,
          options: options,
          default_color: color,
          selected_color: selected_color,
          flash_color: flash_color,
        ).prompt
      end
    end
  end
end