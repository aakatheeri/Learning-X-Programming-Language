"use strict";
exports.__esModule = true;
var vue_router_1 = require("@ionic/vue-router");
var Tabs_vue_1 = require("../views/Tabs.vue");
var routes = [
    {
        path: '/',
        redirect: '/tabs/tab1'
    },
    {
        path: '/tabs/',
        component: Tabs_vue_1["default"],
        children: [
            {
                path: '',
                redirect: 'tab1'
            },
            {
                path: 'tab1',
                component: function () { return Promise.resolve().then(function () { return require('@/views/Tab1.vue'); }); }
            },
            {
                path: 'tab2',
                component: function () { return Promise.resolve().then(function () { return require('@/views/Tab2.vue'); }); }
            },
            {
                path: 'tab3',
                component: function () { return Promise.resolve().then(function () { return require('@/views/Tab3.vue'); }); }
            }
        ]
    }
];
var router = vue_router_1.createRouter({
    history: vue_router_1.createWebHistory(process.env.BASE_URL),
    routes: routes
});
exports["default"] = router;
