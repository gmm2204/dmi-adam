const thisLineage = lineage;

module.exports = {
  fields: [
    {
      label: '',
      value: thisLineage,
      filter: 'lineage',
      appliesToType: ['outbreak', 'outbreak_location', 'cases_group', 'case', 'case_contact']
    },
    {
      label: 'contact.profile.outbreak_date',
      value: contact.date,
      width: 4,
      appliesToType: ['outbreak']
    },
    {
      label: 'contact.profile.outbreak_status',
      value: contact.status,
      width: 4,
      appliesToType: ['outbreak']
    },
    {
      label: 'contact.profile.email',
      value: contact.email,
      width: 6,
      appliesToType: ['person', 'case', 'case_contact']
    },
    {
      label: 'contact.profile.phone',
      value: contact.phone,
      width: 6,
      appliesToType: ['person', 'case', 'case_contact']
    }
  ],
  cards: [],
  context: {}
};