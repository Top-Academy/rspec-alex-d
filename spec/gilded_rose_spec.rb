require_relative '../lib/gilded_rose'

# Three types of unit tests
#   Assert results for queries
#   Assert public side effects for self-commands
#   Assert message for side effects


# Describe-block
#
#   What is being tested
#   Is for setup of non-context-specific variables
#
# Context-block
#
#   In what context is the code being tested
#   Is for setup of context specific variables
#
# It/specify-block, also called examples
#
#   The test itself
#

# Four phases of a test
#   Set up
#   Exercise
#   Assertions
#   Tear down

module SomeModule
  @some_variable = []
end

some_test do
  SomeModule.some_variable << 1
end

after do
  SomeModule.some_variable = []
end

some_test do
  # SomeModule.some_variable == [1], != []
end

RSpec.describe GildedRose do
  describe '#tick' do 
    subject(:rose) { GildedRose.new(name:, quality:, days_remaining:) }

    context 'when name is an empty string, and quality and days_remaining are 0' do
      let!(:result) { rose.tick }

      let(:name) { '' }
      let(:quality) { 0 }
      let(:days_remaining) { 0 }

      # before do
      #   rose.tick 
      # end

      # it 'quality shoud be 0' do
      #   expect(rose.quality).to eq(0)
      # end

      # specify 'days_remaining should be -1' do
      #   expect(rose.days_remaining).to eq(-1)
      # end
      
      after do
        puts :im_done
      end

      specify 'result is 0' do
        expect(result).to eq(0)
      end
    end

    context 'when name is "Aged Brie", quality 50, days_remaining 11' do
      let(:name) { 'Aged Brie' }
      let(:quality) { 50 }
      let(:days_remaining) { 11 }

      before do
        rose.tick
      end

      specify 'quality should remain the same, days_remaining should go down by one' do
        expect(rose.quality).to eq(50)
      end

      specify do
        expect(rose.days_remaining).to eq(10)
      end
    end
  end
end

