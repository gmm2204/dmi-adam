const thisLineage = lineage;

module.exports = {
  fields: [
    {
      label: 'contact.profile.outbreak_description',
      value: contact.description,
      width: 12,
      appliesToType: ['outbreak']
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
      label: 'contact.profile.county',
      value: contact.county,
      width: 4,
      appliesToType: ['outbreak']
    },
    {
      label: 'contact.profile.sub_county',
      value: contact.subcounty,
      width: 4,
      appliesToType: ['outbreak']
    },
    {
      label: 'contact.profile.ward',
      value: contact.ward,
      width: 4,
      appliesToType: ['outbreak']
    },
    {
      label: 'contact.profile.role_label',
      value: contact.role_label,
      width: 6,
      appliesToType: ['person']
    },
    {
      label: 'contact.profile.outbreak_location',
      value: thisLineage,
      filter: 'lineage',
      appliesToType: ['case']
    },
    {
      label: 'contact.profile.case',
      value: thisLineage,
      filter: 'lineage',
      appliesToType: ['case_contact']
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