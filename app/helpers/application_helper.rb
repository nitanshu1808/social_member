module ApplicationHelper
  # The method detects the level of class that needs to be displayed in the flash message
  def flash_class(level)
    case level
      when "notice"   then  "alert-info"
      when "success"  then  "alert-success"
      when "error"    then  "alert-danger"
      when "alert"    then  "alert-warning"
    end
  end
end
