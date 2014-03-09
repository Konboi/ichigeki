require 'spec_helper'
require 'rspec'
require 'tempfile'
require 'pathname'
require 'fileutils'

describe Ichigeki, "hissatsu" do
  sample_rbs = %w(sample.rb sample_require_hissatsu.rb)
  
  before :each do
    sample_rbs.each do |rb|
      File.delete("./spec/#{rb}.log") if File.exist?("./spec/#{rb}.log")
    end
  end

  context "can execute test script" do
    it "First time can doing" do
      sample_rbs.each do |rb|
        stdout = `ruby ./spec/#{rb}`
        expect(stdout).to eq("ichigekiiiii\n")
      end
    end
  end

  context "can't execute twice this script" do
    it "First time can doing" do
      sample_rbs.each do |rb|
        `ruby ./spec/#{rb}`
        stdout = `ruby ./spec/#{rb}`
        expect(stdout).to eq("Can\'t execue! Execution log file [./spec/../spec/#{rb}.log] already exists!\n")
      end
    end
  end

end

