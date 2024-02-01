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
        }]
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
        }]
    },
    {
        name: 'case_exposure',
        title: 'task.title.case_exposure',
        icon: 'icon-exposure-colored',
        appliesTo: 'contacts',
        appliesToType: ['case'],
        appliesIf: function (contact) {
            try {
                const clinical_information = Utils.getMostRecentReport(contact.reports, 'case_clinical_information');
                const record_rvf_animal_exposure = Utils.getField(clinical_information, 'vhf_rvf_screening.rvf_animal_exposure');
                const record_evd_animal_exposure = Utils.getField(clinical_information, 'vhf_evd_screening.evd_animal_exposure');

                if ((record_rvf_animal_exposure === 'yes') ||
                    (record_evd_animal_exposure === 'yes')) {
                    return true;
                } else {
                    return false;
                }
            } catch (error) {
                return false;
            }
        },
        actions: [
            {
                form: 'case_exposure',
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
        }]
    },
    {
        name: 'case_vaccination',
        title: 'task.title.case_vaccination',
        icon: 'icon-vaccine-colored',
        appliesTo: 'contacts',
        appliesToType: ['case'],
        appliesIf: function (contact) {
            try {
                const clinical_information = Utils.getMostRecentReport(contact.reports, 'case_clinical_information');
                const record_cholera_vaccination = Utils.getField(clinical_information, 'cholera_screening.cholera_vaccination');

                if (record_cholera_vaccination === 'yes') {
                    return true;
                } else {
                    return false;
                }
            } catch (error) {
                return false;
            }
        },
        actions: [
            {
                form: 'case_vaccination',
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
        }]
    },
    {
        name: 'case_hospitalization',
        title: 'task.title.case_hospitalization',
        icon: 'icon-hospitalization-colored',
        appliesTo: 'contacts',
        appliesToType: ['case'],
        appliesIf: function (contact) {
            try {
                const clinical_information = Utils.getMostRecentReport(contact.reports, 'case_clinical_information');
                const record_cholera_hospitalization = Utils.getField(clinical_information, 'cholera_screening.cholera_hospitalization');

                if (record_cholera_hospitalization === 'yes') {
                    return true;
                } else {
                    return false;
                }
            } catch (error) {
                return false;
            }
        },
        actions: [
            {
                form: 'case_hospitalization',
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
        }]
    }
];