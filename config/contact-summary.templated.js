module.exports = {
  fields: [
    {
      label: 'contact.profile.role_label',
      value: contact.role_label,
      width: 6,
      appliesToType: ['person', 'person_contact']
    },
    {
      label: 'contact.profile.email',
      value: contact.email,
      width: 6,
      appliesToType: ['person', 'person_contact']
    }, {
      label: 'contact.profile.phone',
      value: contact.phone,
      width: 6,
      appliesToType: ['person', 'person_contact']
    }
  ],
  cards: [],
  context: {}
};