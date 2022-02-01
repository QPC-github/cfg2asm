require 'cfg2asm'

require 'rspec'

describe Cfg2asm::CFG::CFGParser do
  before :all do
    @example_cfg = File.expand_path('../../../examples/java/exampleIf.cfg.gz', __dir__)
  end

  it 'correctly parses information from an nmethod' do
    parser = Cfg2asm::CFG::CFGParser.new($stdout, @example_cfg)
    parser.skip_over_cfg 'After code installation'
    nmethod = parser.read_nmethod
    expect(nmethod.code.arch).to eq 'AMD64'
    expect(nmethod.code.arch_width).to eq '64'
    expect(nmethod.code.base).to eq 0x124B93700
    expect(nmethod.comments.size).to eq 27
  end
end
