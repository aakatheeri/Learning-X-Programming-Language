"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
var __spreadArrays = (this && this.__spreadArrays) || function () {
    for (var s = 0, i = 0, il = arguments.length; i < il; i++) s += arguments[i].length;
    for (var r = Array(s), k = 0, i = 0; i < il; i++)
        for (var a = arguments[i], j = 0, jl = a.length; j < jl; j++, k++)
            r[k] = a[j];
    return r;
};
exports.__esModule = true;
exports.usePhotoGallery = void 0;
var vue_1 = require("vue");
var vue_2 = require("@ionic/vue");
var core_1 = require("@capacitor/core");
var PHOTO_STORAGE = "photos";
function usePhotoGallery() {
    var _this = this;
    var Camera = core_1.Plugins.Camera, Filesystem = core_1.Plugins.Filesystem, Storage = core_1.Plugins.Storage;
    var photos = vue_1.ref([]);
    var PHOTO_STORAGE = "photos";
    var cachePhotos = function () {
        Storage.set({
            key: PHOTO_STORAGE,
            value: JSON.stringify(photos.value)
        });
    };
    vue_1.watch(photos, cachePhotos);
    var loadSaved = function () { return __awaiter(_this, void 0, void 0, function () {
        var photoList, photosInStorage, _i, photosInStorage_1, photo, file;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, Storage.get({ key: PHOTO_STORAGE })];
                case 1:
                    photoList = _a.sent();
                    photosInStorage = photoList.value ? JSON.parse(photoList.value) : [];
                    _i = 0, photosInStorage_1 = photosInStorage;
                    _a.label = 2;
                case 2:
                    if (!(_i < photosInStorage_1.length)) return [3 /*break*/, 5];
                    photo = photosInStorage_1[_i];
                    return [4 /*yield*/, Filesystem.readFile({
                            path: photo.filepath,
                            directory: core_1.FilesystemDirectory.Data
                        })];
                case 3:
                    file = _a.sent();
                    photo.webviewPath = "data:image/jpeg;base64," + file.data;
                    _a.label = 4;
                case 4:
                    _i++;
                    return [3 /*break*/, 2];
                case 5:
                    photos.value = photosInStorage;
                    return [2 /*return*/];
            }
        });
    }); };
    var convertBlobToBase64 = function (blob) { return new Promise(function (resolve, reject) {
        var reader = new FileReader;
        reader.onerror = reject;
        reader.onload = function () {
            resolve(reader.result);
        };
        reader.readAsDataURL(blob);
    }); };
    var savePicture = function (photo, fileName) { return __awaiter(_this, void 0, void 0, function () {
        var base64Data, file, response, blob, savedFile;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    if (!vue_2.isPlatform('hybrid')) return [3 /*break*/, 2];
                    return [4 /*yield*/, Filesystem.readFile({
                            path: photo.path
                        })];
                case 1:
                    file = _a.sent();
                    base64Data = file.data;
                    return [3 /*break*/, 6];
                case 2: return [4 /*yield*/, fetch(photo.webPath)];
                case 3:
                    response = _a.sent();
                    return [4 /*yield*/, response.blob()];
                case 4:
                    blob = _a.sent();
                    return [4 /*yield*/, convertBlobToBase64(blob)];
                case 5:
                    base64Data = (_a.sent());
                    _a.label = 6;
                case 6: return [4 /*yield*/, Filesystem.writeFile({
                        path: fileName,
                        data: base64Data,
                        directory: core_1.FilesystemDirectory.Data
                    })];
                case 7:
                    savedFile = _a.sent();
                    // Use webPath to display the new image instead of base64 since it's
                    // already loaded into memory
                    return [2 /*return*/, {
                            filepath: fileName,
                            webviewPath: photo.webPath
                        }];
            }
        });
    }); };
    var takePhoto = function () { return __awaiter(_this, void 0, void 0, function () {
        var cameraPhoto, fileName, savedFileImage;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, Camera.getPhoto({
                        resultType: core_1.CameraResultType.Uri,
                        source: core_1.CameraSource.Camera,
                        quality: 100
                    })];
                case 1:
                    cameraPhoto = _a.sent();
                    fileName = new Date().getTime() + '.jpeg';
                    return [4 /*yield*/, savePicture(cameraPhoto, fileName)];
                case 2:
                    savedFileImage = _a.sent();
                    photos.value = __spreadArrays([savedFileImage], photos.value);
                    return [2 /*return*/];
            }
        });
    }); };
    var deletePhoto = function (photo) { return __awaiter(_this, void 0, void 0, function () {
        var filename;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    // Remove this photo from the Photos reference data array
                    photos.value = photos.value.filter(function (p) { return p.filepath !== photo.filepath; });
                    filename = photo.filepath.substr(photo.filepath.lastIndexOf('/') + 1);
                    return [4 /*yield*/, Filesystem.deleteFile({
                            path: filename,
                            directory: core_1.FilesystemDirectory.Data
                        })];
                case 1:
                    _a.sent();
                    return [2 /*return*/];
            }
        });
    }); };
    vue_1.onMounted(loadSaved);
    return {
        photos: photos,
        takePhoto: takePhoto,
        deletePhoto: deletePhoto
    };
}
exports.usePhotoGallery = usePhotoGallery;
