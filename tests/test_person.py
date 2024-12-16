from src.models.person import Person


def test_person():
    person = Person(first_name="John", last_name="Doe")
    assert person.first_name == "John"
    assert person.last_name == "Doe"
