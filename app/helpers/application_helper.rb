module ApplicationHelper
  def display_datetime(dt)
    dt.strftime("%m/%d/%Y %l:%M%P")
  end
end
