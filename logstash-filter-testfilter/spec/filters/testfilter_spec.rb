# encoding: utf-8
require_relative '../spec_helper'
require "logstash/filters/testfilter"

describe LogStash::Filters::Testfilter do
  describe "Set to Hello World" do
    let(:config) do <<-CONFIG
      filter {
        testfilter {
          message => "Hello World"
        }

        mutate {
          add_field => {"name" => "Jane Doe"}
        }
      }
    CONFIG
    end

    sample("message" => "some text") do
      expect(subject).to include("message")
      expect(subject.get('message')).to eq('Hello World')
      expect(subject.get('name')).to eq('Jane Doe')
    end
  end
end
