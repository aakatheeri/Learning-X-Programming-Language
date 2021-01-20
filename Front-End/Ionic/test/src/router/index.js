"use strict";
exports.__esModule = true;
var vue_router_1 = require("@ionic/vue-router");
var Home_vue_1 = require("../views/Home.vue");
var routes = [
    {
        path: '/',
        redirect: '/home'
    },
    {
        path: '/home',
        name: 'Home',
        component: Home_vue_1["default"]
    }
];
var router = vue_router_1.createRouter({
    history: vue_router_1.createWebHistory(process.env.BASE_URL),
    routes: routes
});
exports["default"] = router;
