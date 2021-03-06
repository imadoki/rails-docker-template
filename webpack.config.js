const path = require("path");
const WebpackAssetsManifest = require("webpack-assets-manifest");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const glob = require("glob");

const { NODE_ENV } = process.env;
const isProd = NODE_ENV === "production";

const entries = {}
glob.sync("app/javascript/packs/*.js").forEach(filePath => {
  const name = path.basename(filePath, path.extname(filePath));
  entries[name] = path.resolve(__dirname, filePath);
});

const config = {
  mode: isProd ? "production" : "development",
  entry: entries,
  output: {
    path: path.resolve(__dirname, "public/packs"),
    publicPath: isProd ? "/packs/" : "//localhost:8081/packs/",
    filename: isProd ? "[name]-[contenthash].js" : "[name].js",
  },
  resolve: {
    extensions: [".js"],
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, "css-loader"]
      }
    ]
  },
  devServer: {
    host: "0.0.0.0",
    port: 8081,
    headers: {
      "Access-Control-Allow-Origin": "*"
    },
    devMiddleware: {
      publicPath: "/packs/"
    }
  },
  plugins: [
    new WebpackAssetsManifest({
      publicPath: true,
      output: "manifest.json",
      writeToDisk: true
    }),
    new MiniCssExtractPlugin({
      filename: isProd ? "[name]-[contenthash].css" : "[name].css",
    })
  ],
};

if (!isProd) {
  config.devtool = "source-map"
}

module.exports = config;
