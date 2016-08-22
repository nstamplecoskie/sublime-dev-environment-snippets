let path = require('path');
let webpack = require('webpack');
// let HtmlWebpackPlugin = require('html-webpack-plugin');
let HandlebarsPlugin = require('handlebars-webpack-plugin');

let srcPath = path.join(__dirname, 'react');
let buildPath = path.join(__dirname, 'build');
let libPath = path.join(__dirname, 'node_modules');
let configFile = "./config/config.json";

function buildFilePath(currentPath) {
  return path.join(buildPath, currentPath);
}

function srcFilePath(currentPath) {
  return path.join(srcPath, currentPath);
}

const TARGET = process.env.npm_lifecycle_event;

process.env.BABEL_ENV = TARGET;

module.exports = {
  // context: path.join(__dirname, "react"),
  entry: srcFilePath('app.tsx'),

  output: {
    path: buildPath,
    filename: "app.js"
  },

  resolveLoader: {
    root: libPath
  },
  resolve: {
    modulesDirectories: ["./node_modules", "./node_modules/babel"],
    extensions: ['', '.js', '.jsx', '.tsx', '.ts']
  },
  watch: true,
  progress: true,
  colors: true,
  module: {
    loaders: [
      {
        test: /\.tsx?$/,
        include: [srcPath],
        // exclude: ['node_modules','typings'],
        // loaders: 'react-hot!ts-loader'
        loaders: ['babel', 'ts-loader']
      },
      { test: /\.((hbs)|(handlebars))$/, loader: "handlebars-loader" },
      // {
      //   test: /\.[jt]sx?$/,
      //   include: [path.resolve(__dirname, 'react')],
      //   exclude: ['node_modules','typings'],
      //   query: {
      //     presets: ["react"]
      //   },
      //   loader: 'babel?cacheDirectory=cache'
      // },
      {
        test: /\.json?$/,
        loader: 'json'
      }
    ]
  },

  plugins: [
    // new HtmlWebpackPlugin({
    //   title: 'My test react project',
    //   template: srcFilePath('index.html')
    // }),
    new HandlebarsPlugin({
      // path to main hbs template
      entry: srcFilePath("index.hbs"),
      // filepath to result
      output: buildFilePath("index.html"),
      // data passed to main hbs template: `main-template(data)`
      data: require(configFile)['index-data']
    })
  ],

  devServer: {
    contentBase: buildPath,
    progress: true,
    colors: true
  }
};