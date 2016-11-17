Feature: Validate Energy Card Presence

  Scenario: Validate element_type
    Given I have an Energy Card
    When Element Type is required
    Then Error list should contains the Element Type
