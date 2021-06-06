const Dotenv = require('dotenv-webpack');
const path = require('path');

const srcDir = path.resolve(__dirname, './src');

module.exports = (env, options) => {
  const devMode = options.mode !== 'production';

  return {
    entry: './src/index.jsx',
    devServer: {
      hot: true,
      liveReload: true,
    },
    devtool: devMode ? 'inline-source-map' : undefined,
    mode: devMode ? 'development' : 'production',
    module: {
      rules: [
        {
          test: /\.scss$/,
          exclude: /node_modules/,
          use: [
            'style-loader',
            'css-loader',
            'sass-loader',
            'fast-sass-loader',
            {
              loader  : 'sass-resources-loader',
              options : {
                resources: 'src/styles/globally-available.scss',
              },
            },
          ]
        },
        {
          test: /\.css$/,
          use: [{ loader: 'style-loader' }, { loader: 'css-loader' }]
        },
        {
          test: /\.js|\.jsx$/,
          include: srcDir,
          exclude: /node_modules/,
          use: {
            loader: 'babel-loader',
          }
        }
      ]
    },
    output: {
      path: path.resolve(__dirname, '../priv/static/js'),
      filename: 'bundle.js',
    },
    plugins: [
      new Dotenv({ path: '../.env' })
    ],
    resolve: {
      alias: {
        src : srcDir,
      },
      extensions: ['*', '.js', '.jsx', '.css', '.scss'],
    },
    target: 'web',
  }
};
