require 'spec_helper'
require 'rspec'
require 'tempfile'
require 'pathname'
require 'fileutils'

describe Ichigeki, "hissatsu" do
  before :each do
    File.delete("./spec/sample.rb.log") if File.exist?("./spec/sample.rb.log")
  end

  context "can execute test script" do
    it "First time can doing" do
      stdout = `ruby ./spec/sample.rb`
      expect(stdout).to eq("ichigekiiiii\n")
    end
  end

  context "can't execute twice this script" do
    it "First time can doing" do
      `ruby ./spec/sample.rb`
      stdout = `ruby ./spec/sample.rb`
      expect(stdout).to eq("Can\'t execue! Execution log file [./spec/../spec/sample.rb.log] already exists!\n")
    end
  end

end

