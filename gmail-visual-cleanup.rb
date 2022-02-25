# frozen_string_literal: true

def button_height
  302
end

def select_all
  `xdotool mousemove 282 #{button_height} click 1 mousemove restore`
  p('Clicked on Select all')
  sleep 1
end

def delete_all
  `xdotool mousemove 423 #{button_height} click 1 mousemove restore`
  p('Clicked on Delete. Timeout for delete to finish')
  sleep 10
end

def refresh_sometimes(counter, how_ofthen = 20)
  refresh_timeout = 10
  return if counter % how_ofthen != 0

  `xdotool mousemove 76 57 click 1 mousemove restore`
  p("Refreshed gmail page. Waiting #{refresh_timeout} seconds to load")
  sleep refresh_timeout
end

counter = 0
loop.each do
  select_all
  delete_all
  p("Finished deleting 100 messages #{counter + 1} times")
  refresh_sometimes(counter)
  counter += 1
end
