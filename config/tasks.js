module.exports = [
    {
        name: 'case_clinical_information',
        title: 'task.title.case_clinical_information',
        icon: 'icon-symptoms-colored',
        appliesTo: 'contacts',
        appliesToType: ['case'],
        actions: [
            {
                form: 'case_clinical_information',
                modifyContent: function (content, contact, report, event) {
                    contact;
                    report;
                    event;
                }
            }
        ],
        events: [{
            days: 7, //7 days until due
            start: 7, //Show for 7 days before due day
            end: 1, //Show for 1 day after due
        }],
        resolvedIf: function (contact, report, event, dueDate) {
            return Utils.isFormSubmittedInWindow(
                contact.reports,
                'case_clinical_information',
                Utils.addDate(dueDate, -event.start).getTime(),
                Utils.addDate(dueDate, event.end + 1).getTime()
            );
        }
    },
    {
        name: 'case_outcome',
        title: 'task.title.case_outcome',
        icon: 'icon-outcome-colored',
        appliesTo: 'contacts',
        appliesToType: ['case'],
        actions: [
            {
                form: 'case_outcome',
                modifyContent: function (content, contact, report, event) {
                    contact;
                    report;
                    event;
                }
            }
        ],
        events: [{
            days: 7, //7 days until due
            start: 7, //Show for 7 days before due day
            end: 1, //Show for 1 day after due
        }],
        resolvedIf: function (contact, report, event, dueDate) {
            return Utils.isFormSubmittedInWindow(
                contact.reports,
                'case_outcome',
                Utils.addDate(dueDate, -event.start).getTime(),
                Utils.addDate(dueDate, event.end + 1).getTime()
            );
        }
    }
];