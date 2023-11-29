const thisLineage = lineage;

module.exports = {
  fields: [
    {
      label: '',
      value: thisLineage,
      filter: 'lineage',
      appliesToType: ['outbreak']
    },
    {
      label: 'contact.profile.outbreak_date',
      value: contact.date,
      width: 4,
      appliesToType: ['outbreak']
    },
    {
      label: 'contact.type.outbreak',
      value: contact.outbreak_name,
      appliesToType: ['outbreak_location', 'cases_group', 'case']
    },
    {
      label: 'contact.type.outbreak_location',
      value: contact.outbreak_location_name,
      appliesToType: ['cases_group', 'case']
    },
    {
      label: 'contact.profile.outbreak_status',
      value: contact.status,
      width: 4,
      appliesToType: ['outbreak']
    },
    {
      label: 'contact.profile.case_id',
      value: contact.patient_id,
      appliesIf: function () {
        return (contact.patient_id !== undefined) ? true : false;
      },
      width: 6,
      appliesToType: ['case']
    },
    {
      label: 'contact.profile.phone',
      value: contact.phone,
      width: 6,
      appliesToType: ['person', 'case', 'case_contact']
    }
  ]
};