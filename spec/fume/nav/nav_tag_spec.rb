require "spec_helper"

RSpec.describe Fume::Nav::NavTag do
  let(:context) { double :context }
  let(:current) { nil }
  let(:attributes) { { helper: context, current: current, active_class: "active", hide_if_empty: true } }
  subject { described_class.new(attributes) }

  describe "#li_tag" do
    let(:current) { :foo }

    context "then match" do
      before { expect(context).to receive(:content_tag).with(:li, hash_including(class: "active")) }
      it { subject.li_tag(:foo) }

      context "value is Regexp" do
        let(:current) { :foo }
        it { subject.li_tag(/^foo/) }
      end
    end

    context "then not match" do
      before { expect(context).to receive(:content_tag).with(:li, hash_excluding(class: "active")) }
      it { subject.li_tag(:not_match) }
    end
  end
end
