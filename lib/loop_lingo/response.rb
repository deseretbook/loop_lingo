class LoopLingo
  class Response
    def errors=(val)
      set_errors_default
      @error_list = val
    end

    def errors
      set_errors_default
      @error_list
    end

    def error?
      !errors.empty?
    end

    def success?
      !errror?
    end

  private

    def set_errors_default
      @error_list = [] unless @error_list
    end
  end
end