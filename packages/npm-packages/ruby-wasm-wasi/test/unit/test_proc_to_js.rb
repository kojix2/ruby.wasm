require "test-unit"
require "js"

class JS::TestProcToJs < Test::Unit::TestCase

  class Test
    def initialize
    end
  end

  def test_issue_34
    # https://github.com/ruby/ruby.wasm/issues/34
    JS.eval(<<~JS)
    global.wrapProc = (proc) => {
      return () => {
        proc.call('call')
      }
    }
    JS

    require "json"

    proc = Proc.new do
      json = {a: 1}.to_json
      Test.new
    end
    wrapped_proc = JS::global.call('wrapProc', JS::Object.wrap(proc))
    wrapped_proc.call(:call)
  end

end
