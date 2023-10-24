module.exports = [
    // {
    //     name: 'contact_listing',
    //     title: 'task.icon-user-add-outline-blue',
    //     icon: 'icon-user-add-outline-blue',
    //     appliesTo: 'reports',
    //     appliesToType: ['case_investigation'],
    //     actions: [{ form: 'case_contact_listing' }],
    //     events: [{
    //         start: 14,
    //         days: 14,
    //         end: 0,
    //     }],
    //     resolvedIf: function (contact, report, event, dueDate) {
    //         return Utils.isFormSubmittedInWindow(
    //             contact.reports,
    //             'case_contact_listing',
    //             Utils.addDate(dueDate, -event.start).getTime(),
    //             Utils.addDate(dueDate, event.end + 1).getTime()
    //         );
    //     }
    // }
    // {
    //     name: 'task_cholera_lab_report',
    //     title: 'task.lab_form_cholera',
    //     icon: 'icon-lab-outline-gray',
    //     appliesTo: 'contacts',
    //     appliesIf: function (c) {
    //         return Utils.getMostRecentReport(c.reports, 'cholera_case_investigation');
    //     },
    //     appliesToType: ['person'],
    //     actions: [{ form: 'cholera_lab_form' }],
    //     events: [{
    //         start: 14,
    //         days: 14,
    //         end: 0,
    //     }],
    //     resolvedIf: function (contact, report, event, dueDate) {
    //         return Utils.isFormSubmittedInWindow(
    //             contact.reports,
    //             'cholera_lab_form',
    //             Utils.addDate(dueDate, -event.start).getTime(),
    //             Utils.addDate(dueDate, event.end + 1).getTime()
    //         );
    //     }
    // }
];