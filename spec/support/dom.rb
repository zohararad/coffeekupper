# Stub DOM window object for V8::Context
# Used to properly test CoffeeKup in a simulated browser environment
class Window

  def attachEvent(ev, cb, b = false); end

  def window; self; end

end