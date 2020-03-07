const { environment } = require('@rails/webpacker')
const webpack = require('webpack');

const erb =  require('./loaders/erb')

environment.plugins.append('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
}));

const babelLoader = environment.loaders.get('babel')
environment.loaders.insert('coffee', {
    test: /\.coffee(\.erb)?$/,
    use:  babelLoader.use.concat(['coffee-loader'])
})

environment.loaders.append('erb', erb)

module.exports = environment;