


<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    
    
    <title>bpmn-js-examples/app.js at master · bpmn-io/bpmn-js-examples · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="bpmn-io/bpmn-js-examples" name="twitter:title" /><meta content="bpmn-js-examples - Some examples on how to use bpmn-js" name="twitter:description" /><meta content="https://avatars3.githubusercontent.com/u/6481734?v=3&amp;s=400" name="twitter:image:src" />
      <meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars3.githubusercontent.com/u/6481734?v=3&amp;s=400" property="og:image" /><meta content="bpmn-io/bpmn-js-examples" property="og:title" /><meta content="https://github.com/bpmn-io/bpmn-js-examples" property="og:url" /><meta content="bpmn-js-examples - Some examples on how to use bpmn-js" property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    
    <meta name="pjax-timeout" content="1000">
    

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>
      <meta name="google-analytics" content="UA-3769691-2">

    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="02F409A6:58E7:5B47C2:5522FBC8" name="octolytics-dimension-request_id" />
    
    <meta content="Rails, view, blob#show" name="analytics-event" />
    <meta class="js-ga-set" name="dimension1" content="Logged Out">
    <meta class="js-ga-set" name="dimension2" content="Header v3">
    <meta name="is-dotcom" content="true">
    <meta name="hostname" content="github.com">
    <meta name="user-login" content="">

    
    <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">


    <meta content="authenticity_token" name="csrf-param" />
<meta content="Xz8fqIL+SeHEREE81Sq8EPgZAexEzVkr3z4eB4H/lUAed8IfOPO2dV36Qc5ZvXEVD6F1hpx2OL4+HVRvZuRDjA==" name="csrf-token" />

    <link href="https://assets-cdn.github.com/assets/github-b9a6ff74be89fc3bd0700145f09893176e0217b525876169a377b19cc4434e53.css" media="all" rel="stylesheet" />
    <link href="https://assets-cdn.github.com/assets/github2-c52092ec66da34c30c59f04456bc9596135db6e6f397ab48420462c9a05abee6.css" media="all" rel="stylesheet" />
    
    


    <meta http-equiv="x-pjax-version" content="73f04ae15cf88268cda88e8d7a7fa681">

      
  <meta name="description" content="bpmn-js-examples - Some examples on how to use bpmn-js">
  <meta name="go-import" content="github.com/bpmn-io/bpmn-js-examples git https://github.com/bpmn-io/bpmn-js-examples.git">

  <meta content="6481734" name="octolytics-dimension-user_id" /><meta content="bpmn-io" name="octolytics-dimension-user_login" /><meta content="20054543" name="octolytics-dimension-repository_id" /><meta content="bpmn-io/bpmn-js-examples" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="20054543" name="octolytics-dimension-repository_network_root_id" /><meta content="bpmn-io/bpmn-js-examples" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/bpmn-io/bpmn-js-examples/commits/master.atom" rel="alternate" title="Recent Commits to bpmn-js-examples:master" type="application/atom+xml">

  </head>


  <body class="logged_out  env-production windows vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div class="wrapper">
      
      
      


        
        <div class="header header-logged-out" role="banner">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/" data-ga-click="(Logged out) Header, go to homepage, icon:logo-wordmark">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions" role="navigation">
        <a class="btn btn-primary" href="/join" data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up">Sign up</a>
      <a class="btn" href="/login?return_to=%2Fbpmn-io%2Fbpmn-js-examples%2Fblob%2Fmaster%2Finteraction%2Fapp%2Fapp.js" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">Sign in</a>
    </div>

    <div class="site-search repo-scope js-site-search" role="search">
      <form accept-charset="UTF-8" action="/bpmn-io/bpmn-js-examples/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/bpmn-io/bpmn-js-examples/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <input type="text"
    class="js-site-search-field is-clearable"
    data-hotkey="s"
    name="q"
    placeholder="Search"
    data-global-scope-placeholder="Search GitHub"
    data-repo-scope-placeholder="Search"
    tabindex="1"
    autocapitalize="off">
  <div class="scope-badge">This repository</div>
</form>
    </div>

      <ul class="header-nav left" role="navigation">
          <li class="header-nav-item">
            <a class="header-nav-link" href="/explore" data-ga-click="(Logged out) Header, go to explore, text:explore">Explore</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/features" data-ga-click="(Logged out) Header, go to features, text:features">Features</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://enterprise.github.com/" data-ga-click="(Logged out) Header, go to enterprise, text:enterprise">Enterprise</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/blog" data-ga-click="(Logged out) Header, go to blog, text:blog">Blog</a>
          </li>
      </ul>

  </div>
</div>



      <div id="start-of-content" class="accessibility-aid"></div>
          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    <div id="js-flash-container">
      
    </div>
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        
<ul class="pagehead-actions">

  <li>
      <a href="/login?return_to=%2Fbpmn-io%2Fbpmn-js-examples"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to watch a repository" rel="nofollow">
    <span class="octicon octicon-eye"></span>
    Watch
  </a>
  <a class="social-count" href="/bpmn-io/bpmn-js-examples/watchers">
    9
  </a>

  </li>

  <li>
      <a href="/login?return_to=%2Fbpmn-io%2Fbpmn-js-examples"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to star a repository" rel="nofollow">
    <span class="octicon octicon-star"></span>
    Star
  </a>

    <a class="social-count js-social-count" href="/bpmn-io/bpmn-js-examples/stargazers">
      7
    </a>

  </li>

    <li>
      <a href="/login?return_to=%2Fbpmn-io%2Fbpmn-js-examples"
        class="btn btn-sm btn-with-count tooltipped tooltipped-n"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-repo-forked"></span>
        Fork
      </a>
      <a href="/bpmn-io/bpmn-js-examples/network" class="social-count">
        14
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="mega-octicon octicon-repo"></span>
          <span class="author"><a href="/bpmn-io" class="url fn" itemprop="url" rel="author"><span itemprop="title">bpmn-io</span></a></span><!--
       --><span class="path-divider">/</span><!--
       --><strong><a href="/bpmn-io/bpmn-js-examples" class="js-current-repository" data-pjax="#js-repo-pjax-container">bpmn-js-examples</a></strong>

          <span class="page-context-loader">
            <img alt="" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            
<nav class="sunken-menu repo-nav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container"
     data-issue-count-url="/bpmn-io/bpmn-js-examples/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/bpmn-io/bpmn-js-examples" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /bpmn-io/bpmn-js-examples">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/bpmn-io/bpmn-js-examples/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /bpmn-io/bpmn-js-examples/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull requests">
      <a href="/bpmn-io/bpmn-js-examples/pulls" aria-label="Pull requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /bpmn-io/bpmn-js-examples/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>

  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/bpmn-io/bpmn-js-examples/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /bpmn-io/bpmn-js-examples/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/bpmn-io/bpmn-js-examples/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /bpmn-io/bpmn-js-examples/graphs">
        <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>
  </ul>


</nav>

              <div class="only-with-full-nav">
                  
<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/bpmn-io/bpmn-js-examples.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/bpmn-io/bpmn-js-examples" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>



<p class="clone-options">You can clone with
  <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a> or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</p>


  <a href="https://windows.github.com" class="btn btn-sm sidebar-button" title="Save bpmn-io/bpmn-js-examples to your computer and use it in GitHub Desktop." aria-label="Save bpmn-io/bpmn-js-examples to your computer and use it in GitHub Desktop.">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>

                <a href="/bpmn-io/bpmn-js-examples/archive/master.zip"
                   class="btn btn-sm sidebar-button"
                   aria-label="Download the contents of bpmn-io/bpmn-js-examples as a zip file"
                   title="Download the contents of bpmn-io/bpmn-js-examples as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          

<a href="/bpmn-io/bpmn-js-examples/blob/94a6a8bfbc72b3a2e53f7ae3d6ebcc726aef0bae/interaction/app/app.js" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:c1fdb2765f3e9cae065581f0a00225ed -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu js-menu-container js-select-menu left">
  <span class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    title="master"
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Filter branches/tags" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/bpmn-io/bpmn-js-examples/blob/master/interaction/app/app.js"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="master">
                master
              </span>
            </a>
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/bpmn-io/bpmn-js-examples/tree/v0.9.0/interaction/app/app.js"
                 data-name="v0.9.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.9.0">v0.9.0</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/bpmn-io/bpmn-js-examples/tree/v0.8.0/interaction/app/app.js"
                 data-name="v0.8.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.8.0">v0.8.0</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/bpmn-io/bpmn-js-examples/tree/v0.7.0/interaction/app/app.js"
                 data-name="v0.7.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.7.0">v0.7.0</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/bpmn-io/bpmn-js-examples/tree/v0.6.0/interaction/app/app.js"
                 data-name="v0.6.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.6.0">v0.6.0</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/bpmn-io/bpmn-js-examples/tree/v0.5.1/interaction/app/app.js"
                 data-name="v0.5.1"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.5.1">v0.5.1</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/bpmn-io/bpmn-js-examples/tree/v0.4.1/interaction/app/app.js"
                 data-name="v0.4.1"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.4.1">v0.4.1</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/bpmn-io/bpmn-js-examples/tree/v0.3.0/interaction/app/app.js"
                 data-name="v0.3.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="v0.3.0">v0.3.0</a>
            </div>
        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

  <div class="btn-group right">
    <a href="/bpmn-io/bpmn-js-examples/find/master"
          class="js-show-file-finder btn btn-sm empty-icon tooltipped tooltipped-s"
          data-pjax
          data-hotkey="t"
          aria-label="Quickly jump between files">
      <span class="octicon octicon-list-unordered"></span>
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
  </div>

  <div class="breadcrumb js-zeroclipboard-target">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/bpmn-io/bpmn-js-examples" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">bpmn-js-examples</span></a></span></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/bpmn-io/bpmn-js-examples/tree/master/interaction" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">interaction</span></a></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/bpmn-io/bpmn-js-examples/tree/master/interaction/app" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">app</span></a></span><span class="separator">/</span><strong class="final-path">app.js</strong>
  </div>
</div>


  <div class="commit file-history-tease">
    <div class="file-history-tease-header">
        <img alt="@nikku" class="avatar" data-user="58601" height="24" src="https://avatars2.githubusercontent.com/u/58601?v=3&amp;s=48" width="24" />
        <span class="author"><a href="/nikku" rel="contributor">nikku</a></span>
        <time datetime="2015-01-29T12:09:04Z" is="relative-time">Jan 29, 2015</time>
        <div class="commit-title">
            <a href="/bpmn-io/bpmn-js-examples/commit/b147edec458c176a0f19da01de35753c2c22e6c6" class="message" data-pjax="true" title="feat(examples): add interaction example">feat(examples): add interaction example</a>
        </div>
    </div>

    <div class="participation">
      <p class="quickstat">
        <a href="#blob_contributors_box" rel="facebox">
          <strong>1</strong>
           contributor
        </a>
      </p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="@nikku" data-user="58601" height="24" src="https://avatars2.githubusercontent.com/u/58601?v=3&amp;s=48" width="24" />
            <a href="/nikku">nikku</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
    <div class="file-actions">

      <div class="btn-group">
        <a href="/bpmn-io/bpmn-js-examples/raw/master/interaction/app/app.js" class="btn btn-sm " id="raw-url">Raw</a>
          <a href="/bpmn-io/bpmn-js-examples/blame/master/interaction/app/app.js" class="btn btn-sm js-update-url-with-hash">Blame</a>
        <a href="/bpmn-io/bpmn-js-examples/commits/master/interaction/app/app.js" class="btn btn-sm " rel="nofollow">History</a>
      </div>

        <a class="octicon-btn tooltipped tooltipped-nw"
           href="https://windows.github.com"
           aria-label="Open this file in GitHub for Windows">
            <span class="octicon octicon-device-desktop"></span>
        </a>

          <button type="button" class="octicon-btn disabled tooltipped tooltipped-n" aria-label="You must be signed in to make or propose changes">
            <span class="octicon octicon-pencil"></span>
          </button>

        <button type="button" class="octicon-btn octicon-btn-danger disabled tooltipped tooltipped-n" aria-label="You must be signed in to make or propose changes">
          <span class="octicon octicon-trashcan"></span>
        </button>
    </div>

    <div class="file-info">
        78 lines (55 sloc)
        <span class="file-info-divider"></span>
      12.798 kb
    </div>
  </div>
  
  <div class="blob-wrapper data type-javascript">
      <table class="highlight tab-size-8 js-file-line-container">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code js-file-line"><span class="pl-c">/**</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code js-file-line"><span class="pl-c"> * An example that showcases how to interact with a loaded</span></td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code js-file-line"><span class="pl-c"> * BPMN 2.0 diagram using bpmn-js</span></td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code js-file-line"><span class="pl-c"> */</span></td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code js-file-line">(<span class="pl-k">function</span>() {</td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code js-file-line">  <span class="pl-k">var</span> <span class="pl-en">console</span> <span class="pl-k">=</span> <span class="pl-c1">document</span>.querySelector(<span class="pl-s"><span class="pl-pds">&#39;</span>#js-console<span class="pl-pds">&#39;</span></span>);</td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code js-file-line">  <span class="pl-k">function</span> <span class="pl-en">log</span>() {</td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code js-file-line">    <span class="pl-en">console</span>.<span class="pl-c1">value</span> <span class="pl-k">+=</span> <span class="pl-c1">Array</span>.<span class="pl-c1">prototype</span>.slice.<span class="pl-c1">call</span>(arguments).map(<span class="pl-k">function</span>(<span class="pl-smi">e</span>) {</td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code js-file-line">      <span class="pl-k">return</span> <span class="pl-c1">String</span>(e);</td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code js-file-line">    }).<span class="pl-c1">join</span>(<span class="pl-s"><span class="pl-pds">&#39;</span> <span class="pl-pds">&#39;</span></span>);</td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code js-file-line">    <span class="pl-en">console</span>.<span class="pl-c1">value</span> <span class="pl-k">+=</span> <span class="pl-s"><span class="pl-pds">&#39;</span><span class="pl-cce">\n</span><span class="pl-pds">&#39;</span></span>;</td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code js-file-line">    <span class="pl-en">console</span>.scrollTop <span class="pl-k">=</span> <span class="pl-en">console</span>.scrollHeight;</td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code js-file-line">  <span class="pl-k">var</span> BpmnJS <span class="pl-k">=</span> <span class="pl-c1">window</span>.BpmnJS;</td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code js-file-line">  <span class="pl-c">// the diagram to display</span></td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code js-file-line">  <span class="pl-c">// you may load it asynchronously via ajax, too</span></td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code js-file-line">  var diagramXML = &quot;&lt;?xml version=\&quot;1.0\&quot; encoding=\&quot;UTF-8\&quot;?&gt;\r\n&lt;definitions xmlns=\&quot;http://www.omg.org/spec/BPMN/20100524/MODEL\&quot;\r\n             xmlns:bpmndi=\&quot;http://www.omg.org/spec/BPMN/20100524/DI\&quot;\r\n             xmlns:omgdc=\&quot;http://www.omg.org/spec/DD/20100524/DC\&quot;\r\n             xmlns:omgdi=\&quot;http://www.omg.org/spec/DD/20100524/DI\&quot;\r\n             xmlns:xsi=\&quot;http://www.w3.org/2001/XMLSchema-instance\&quot;\r\n             expressionLanguage=\&quot;http://www.w3.org/1999/XPath\&quot;\r\n             typeLanguage=\&quot;http://www.w3.org/2001/XMLSchema\&quot;\r\n             targetNamespace=\&quot;\&quot;\r\n             xsi:schemaLocation=\&quot;http://www.omg.org/spec/BPMN/20100524/MODEL http://www.omg.org/spec/BPMN/2.0/20100501/BPMN20.xsd\&quot;&gt;\r\n&lt;collaboration id=\&quot;sid-c0e745ff-361e-4afb-8c8d-2a1fc32b1424\&quot;&gt;\r\n    &lt;participant id=\&quot;sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F\&quot; name=\&quot;Customer\&quot; processRef=\&quot;sid-C3803939-0872-457F-8336-EAE484DC4A04\&quot;&gt;\r\n    &lt;/participant&gt;\r\n&lt;/collaboration&gt;\r\n&lt;process id=\&quot;sid-C3803939-0872-457F-8336-EAE484DC4A04\&quot; isClosed=\&quot;false\&quot; isExecutable=\&quot;false\&quot; name=\&quot;Customer\&quot; processType=\&quot;None\&quot;&gt;\r\n    &lt;extensionElements/&gt;\r\n    &lt;laneSet id=\&quot;sid-b167d0d7-e761-4636-9200-76b7f0e8e83a\&quot;&gt;\r\n        &lt;lane id=\&quot;sid-57E4FE0D-18E4-478D-BC5D-B15164E93254\&quot;&gt;\r\n            &lt;flowNodeRef&gt;sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138&lt;/flowNodeRef&gt;\r\n            &lt;flowNodeRef&gt;sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26&lt;/flowNodeRef&gt;\r\n            &lt;flowNodeRef&gt;SCAN_OK&lt;/flowNodeRef&gt;\r\n            &lt;flowNodeRef&gt;sid-E49425CF-8287-4798-B622-D2A7D78EF00B&lt;/flowNodeRef&gt;\r\n            &lt;flowNodeRef&gt;END_EVENT&lt;/flowNodeRef&gt;\r\n            &lt;flowNodeRef&gt;sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9&lt;/flowNodeRef&gt;\r\n        &lt;/lane&gt;\r\n    &lt;/laneSet&gt;\r\n    &lt;startEvent id=\&quot;sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\&quot; name=\&quot;Notices&amp;#10;QR code\&quot;&gt;\r\n        &lt;outgoing&gt;sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD&lt;/outgoing&gt;\r\n    &lt;/startEvent&gt;\r\n    &lt;task completionQuantity=\&quot;1\&quot; id=\&quot;sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\&quot; isForCompensation=\&quot;false\&quot; name=\&quot;Scan QR code\&quot; startQuantity=\&quot;1\&quot;&gt;\r\n        &lt;incoming&gt;sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D&lt;/incoming&gt;\r\n        &lt;outgoing&gt;sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A&lt;/outgoing&gt;\r\n    &lt;/task&gt;\r\n    &lt;exclusiveGateway gatewayDirection=\&quot;Diverging\&quot; id=\&quot;SCAN_OK\&quot; name=\&quot;Scan successful?&amp;#10;\&quot;&gt;\r\n        &lt;incoming&gt;sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A&lt;/incoming&gt;\r\n        &lt;outgoing&gt;sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB&lt;/outgoing&gt;\r\n        &lt;outgoing&gt;sid-337A23B9-A923-4CCE-B613-3E247B773CCE&lt;/outgoing&gt;\r\n    &lt;/exclusiveGateway&gt;\r\n    &lt;task completionQuantity=\&quot;1\&quot; id=\&quot;sid-E49425CF-8287-4798-B622-D2A7D78EF00B\&quot; isForCompensation=\&quot;false\&quot; name=\&quot;Open product information in mobile  app\&quot; startQuantity=\&quot;1\&quot;&gt;\r\n        &lt;incoming&gt;sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB&lt;/incoming&gt;\r\n        &lt;outgoing&gt;sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C&lt;/outgoing&gt;\r\n    &lt;/task&gt;\r\n    &lt;endEvent id=\&quot;END_EVENT\&quot; name=\&quot;Is informed\&quot;&gt;\r\n        &lt;incoming&gt;sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C&lt;/incoming&gt;\r\n    &lt;/endEvent&gt;\r\n    &lt;exclusiveGateway gatewayDirection=\&quot;Converging\&quot; id=\&quot;sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\&quot;&gt;\r\n        &lt;incoming&gt;sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD&lt;/incoming&gt;\r\n        &lt;incoming&gt;sid-337A23B9-A923-4CCE-B613-3E247B773CCE&lt;/incoming&gt;\r\n        &lt;outgoing&gt;sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D&lt;/outgoing&gt;\r\n    &lt;/exclusiveGateway&gt;\r\n    &lt;sequenceFlow id=\&quot;sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD\&quot; sourceRef=\&quot;sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\&quot; targetRef=\&quot;sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\&quot;/&gt;\r\n    &lt;sequenceFlow id=\&quot;sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A\&quot; sourceRef=\&quot;sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\&quot; targetRef=\&quot;SCAN_OK\&quot;/&gt;\r\n    &lt;sequenceFlow id=\&quot;sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C\&quot; sourceRef=\&quot;sid-E49425CF-8287-4798-B622-D2A7D78EF00B\&quot; targetRef=\&quot;END_EVENT\&quot;/&gt;\r\n    &lt;sequenceFlow id=\&quot;sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB\&quot; name=\&quot;Yes\&quot; sourceRef=\&quot;SCAN_OK\&quot; targetRef=\&quot;sid-E49425CF-8287-4798-B622-D2A7D78EF00B\&quot;/&gt;\r\n    &lt;sequenceFlow id=\&quot;sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D\&quot; sourceRef=\&quot;sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\&quot; targetRef=\&quot;sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\&quot;/&gt;\r\n    &lt;sequenceFlow id=\&quot;sid-337A23B9-A923-4CCE-B613-3E247B773CCE\&quot; name=\&quot;No\&quot; sourceRef=\&quot;SCAN_OK\&quot; targetRef=\&quot;sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\&quot;/&gt;\r\n&lt;/process&gt;\r\n&lt;bpmndi:BPMNDiagram id=\&quot;sid-74620812-92c4-44e5-949c-aa47393d3830\&quot;&gt;\r\n    &lt;bpmndi:BPMNPlane bpmnElement=\&quot;sid-c0e745ff-361e-4afb-8c8d-2a1fc32b1424\&quot; id=\&quot;sid-cdcae759-2af7-4a6d-bd02-53f3352a731d\&quot;&gt;\r\n        &lt;bpmndi:BPMNShape bpmnElement=\&quot;sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F\&quot; id=\&quot;sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F_gui\&quot; isHorizontal=\&quot;true\&quot;&gt;\r\n            &lt;omgdc:Bounds height=\&quot;250.0\&quot; width=\&quot;933.0\&quot; x=\&quot;42.5\&quot; y=\&quot;75.0\&quot;/&gt;\r\n            &lt;bpmndi:BPMNLabel labelStyle=\&quot;sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\&quot;&gt;\r\n                &lt;omgdc:Bounds height=\&quot;59.142852783203125\&quot; width=\&quot;12.000000000000014\&quot; x=\&quot;47.49999999999999\&quot; y=\&quot;170.42857360839844\&quot;/&gt;\r\n            &lt;/bpmndi:BPMNLabel&gt;\r\n        &lt;/bpmndi:BPMNShape&gt;\r\n        &lt;bpmndi:BPMNShape bpmnElement=\&quot;sid-57E4FE0D-18E4-478D-BC5D-B15164E93254\&quot; id=\&quot;sid-57E4FE0D-18E4-478D-BC5D-B15164E93254_gui\&quot; isHorizontal=\&quot;true\&quot;&gt;\r\n            &lt;omgdc:Bounds height=\&quot;250.0\&quot; width=\&quot;903.0\&quot; x=\&quot;72.5\&quot; y=\&quot;75.0\&quot;/&gt;\r\n        &lt;/bpmndi:BPMNShape&gt;\r\n        &lt;bpmndi:BPMNShape bpmnElement=\&quot;sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\&quot; id=\&quot;sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138_gui\&quot;&gt;\r\n            &lt;omgdc:Bounds height=\&quot;30.0\&quot; width=\&quot;30.0\&quot; x=\&quot;150.0\&quot; y=\&quot;165.0\&quot;/&gt;\r\n            &lt;bpmndi:BPMNLabel labelStyle=\&quot;sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\&quot;&gt;\r\n                &lt;omgdc:Bounds height=\&quot;22.0\&quot; width=\&quot;46.35714340209961\&quot; x=\&quot;141.8214282989502\&quot; y=\&quot;197.0\&quot;/&gt;\r\n            &lt;/bpmndi:BPMNLabel&gt;\r\n        &lt;/bpmndi:BPMNShape&gt;\r\n        &lt;bpmndi:BPMNShape bpmnElement=\&quot;sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\&quot; id=\&quot;sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26_gui\&quot;&gt;\r\n            &lt;omgdc:Bounds height=\&quot;80.0\&quot; width=\&quot;100.0\&quot; x=\&quot;352.5\&quot; y=\&quot;140.0\&quot;/&gt;\r\n            &lt;bpmndi:BPMNLabel labelStyle=\&quot;sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\&quot;&gt;\r\n                &lt;omgdc:Bounds height=\&quot;12.0\&quot; width=\&quot;84.0\&quot; x=\&quot;360.5\&quot; y=\&quot;172.0\&quot;/&gt;\r\n            &lt;/bpmndi:BPMNLabel&gt;\r\n        &lt;/bpmndi:BPMNShape&gt;\r\n        &lt;bpmndi:BPMNShape bpmnElement=\&quot;SCAN_OK\&quot; id=\&quot;SCAN_OK_gui\&quot; isMarkerVisible=\&quot;true\&quot;&gt;\r\n            &lt;omgdc:Bounds height=\&quot;40.0\&quot; width=\&quot;40.0\&quot; x=\&quot;550.0\&quot; y=\&quot;160.0\&quot;/&gt;\r\n            &lt;bpmndi:BPMNLabel labelStyle=\&quot;sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\&quot;&gt;\r\n                &lt;omgdc:Bounds height=\&quot;12.0\&quot; width=\&quot;102.0\&quot; x=\&quot;521.0\&quot; y=\&quot;127.0\&quot;/&gt;\r\n            &lt;/bpmndi:BPMNLabel&gt;\r\n        &lt;/bpmndi:BPMNShape&gt;\r\n        &lt;bpmndi:BPMNShape bpmnElement=\&quot;sid-E49425CF-8287-4798-B622-D2A7D78EF00B\&quot; id=\&quot;sid-E49425CF-8287-4798-B622-D2A7D78EF00B_gui\&quot;&gt;\r\n            &lt;omgdc:Bounds height=\&quot;80.0\&quot; width=\&quot;100.0\&quot; x=\&quot;687.5\&quot; y=\&quot;140.0\&quot;/&gt;\r\n            &lt;bpmndi:BPMNLabel labelStyle=\&quot;sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\&quot;&gt;\r\n                &lt;omgdc:Bounds height=\&quot;36.0\&quot; width=\&quot;83.14285278320312\&quot; x=\&quot;695.9285736083984\&quot; y=\&quot;162.0\&quot;/&gt;\r\n            &lt;/bpmndi:BPMNLabel&gt;\r\n        &lt;/bpmndi:BPMNShape&gt;\r\n        &lt;bpmndi:BPMNShape bpmnElement=\&quot;END_EVENT\&quot; id=\&quot;END_EVENT_gui\&quot;&gt;\r\n            &lt;omgdc:Bounds height=\&quot;28.0\&quot; width=\&quot;28.0\&quot; x=\&quot;865.0\&quot; y=\&quot;166.0\&quot;/&gt;\r\n            &lt;bpmndi:BPMNLabel labelStyle=\&quot;sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\&quot;&gt;\r\n                &lt;omgdc:Bounds height=\&quot;11.0\&quot; width=\&quot;62.857147216796875\&quot; x=\&quot;847.5714263916016\&quot; y=\&quot;196.0\&quot;/&gt;\r\n            &lt;/bpmndi:BPMNLabel&gt;\r\n        &lt;/bpmndi:BPMNShape&gt;\r\n        &lt;bpmndi:BPMNShape bpmnElement=\&quot;sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\&quot; id=\&quot;sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9_gui\&quot; isMarkerVisible=\&quot;true\&quot;&gt;\r\n            &lt;omgdc:Bounds height=\&quot;40.0\&quot; width=\&quot;40.0\&quot; x=\&quot;240.0\&quot; y=\&quot;160.0\&quot;/&gt;\r\n        &lt;/bpmndi:BPMNShape&gt;\r\n        &lt;bpmndi:BPMNEdge bpmnElement=\&quot;sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A\&quot; id=\&quot;sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A_gui\&quot;&gt;\r\n            &lt;omgdi:waypoint x=\&quot;452.5\&quot; y=\&quot;180\&quot;/&gt;\r\n            &lt;omgdi:waypoint x=\&quot;550.0\&quot; y=\&quot;180\&quot;/&gt;\r\n        &lt;/bpmndi:BPMNEdge&gt;\r\n        &lt;bpmndi:BPMNEdge bpmnElement=\&quot;sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB\&quot; id=\&quot;sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB_gui\&quot;&gt;\r\n            &lt;omgdi:waypoint x=\&quot;590.0\&quot; y=\&quot;180\&quot;/&gt;\r\n            &lt;omgdi:waypoint x=\&quot;687.5\&quot; y=\&quot;180\&quot;/&gt;\r\n            &lt;bpmndi:BPMNLabel labelStyle=\&quot;sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\&quot;&gt;\r\n                &lt;omgdc:Bounds height=\&quot;12.048704338048935\&quot; width=\&quot;16.32155963195521\&quot; x=\&quot;597.8850936986571\&quot; y=\&quot;155\&quot;/&gt;\r\n            &lt;/bpmndi:BPMNLabel&gt;\r\n        &lt;/bpmndi:BPMNEdge&gt;\r\n        &lt;bpmndi:BPMNEdge bpmnElement=\&quot;sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD\&quot; id=\&quot;sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD_gui\&quot;&gt;\r\n            &lt;omgdi:waypoint x=\&quot;180.0\&quot; y=\&quot;180\&quot;/&gt;\r\n            &lt;omgdi:waypoint x=\&quot;240.0\&quot; y=\&quot;180\&quot;/&gt;\r\n        &lt;/bpmndi:BPMNEdge&gt;\r\n        &lt;bpmndi:BPMNEdge bpmnElement=\&quot;sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D\&quot; id=\&quot;sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D_gui\&quot;&gt;\r\n            &lt;omgdi:waypoint x=\&quot;280.0\&quot; y=\&quot;180\&quot;/&gt;\r\n            &lt;omgdi:waypoint x=\&quot;352.5\&quot; y=\&quot;180\&quot;/&gt;\r\n        &lt;/bpmndi:BPMNEdge&gt;\r\n        &lt;bpmndi:BPMNEdge bpmnElement=\&quot;sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C\&quot; id=\&quot;sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C_gui\&quot;&gt;\r\n            &lt;omgdi:waypoint x=\&quot;787.5\&quot; y=\&quot;180.0\&quot;/&gt;\r\n            &lt;omgdi:waypoint x=\&quot;865.0\&quot; y=\&quot;180.0\&quot;/&gt;\r\n        &lt;/bpmndi:BPMNEdge&gt;\r\n        &lt;bpmndi:BPMNEdge bpmnElement=\&quot;sid-337A23B9-A923-4CCE-B613-3E247B773CCE\&quot; id=\&quot;sid-337A23B9-A923-4CCE-B613-3E247B773CCE_gui\&quot;&gt;\r\n            &lt;omgdi:waypoint x=\&quot;570.5\&quot; y=\&quot;200.0\&quot;/&gt;\r\n            &lt;omgdi:waypoint x=\&quot;570.5\&quot; y=\&quot;269.0\&quot;/&gt;\r\n            &lt;omgdi:waypoint x=\&quot;260.5\&quot; y=\&quot;269.0\&quot;/&gt;\r\n            &lt;omgdi:waypoint x=\&quot;260.5\&quot; y=\&quot;200.0\&quot;/&gt;\r\n            &lt;bpmndi:BPMNLabel labelStyle=\&quot;sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\&quot;&gt;\r\n                &lt;omgdc:Bounds height=\&quot;21.4285888671875\&quot; width=\&quot;12.0\&quot; x=\&quot;550\&quot; y=\&quot;205\&quot;/&gt;\r\n            &lt;/bpmndi:BPMNLabel&gt;\r\n        &lt;/bpmndi:BPMNEdge&gt;\r\n    &lt;/bpmndi:BPMNPlane&gt;\r\n    &lt;bpmndi:BPMNLabelStyle id=\&quot;sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\&quot;&gt;\r\n        &lt;omgdc:Font isBold=\&quot;false\&quot; isItalic=\&quot;false\&quot; isStrikeThrough=\&quot;false\&quot; isUnderline=\&quot;false\&quot; name=\&quot;Arial\&quot; size=\&quot;11.0\&quot;/&gt;\r\n    &lt;/bpmndi:BPMNLabelStyle&gt;\r\n    &lt;bpmndi:BPMNLabelStyle id=\&quot;sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\&quot;&gt;\r\n        &lt;omgdc:Font isBold=\&quot;false\&quot; isItalic=\&quot;false\&quot; isStrikeThrough=\&quot;false\&quot; isUnderline=\&quot;false\&quot; name=\&quot;Arial\&quot; size=\&quot;12.0\&quot;/&gt;\r\n    &lt;/bpmndi:BPMNLabelStyle&gt;\r\n&lt;/bpmndi:BPMNDiagram&gt;\r\n&lt;/definitions&gt;\r\n\r\n&quot;;</td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code js-file-line">  <span class="pl-k">var</span> viewer <span class="pl-k">=</span> <span class="pl-k">new</span> <span class="pl-en">BpmnJS</span>({ container<span class="pl-k">:</span> <span class="pl-c1">document</span>.querySelector(<span class="pl-s"><span class="pl-pds">&#39;</span>#js-canvas<span class="pl-pds">&#39;</span></span>), height<span class="pl-k">:</span> <span class="pl-c1">400</span> });</td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code js-file-line">  viewer.importXML(diagramXML, <span class="pl-k">function</span>(<span class="pl-smi">err</span>) {</td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code js-file-line">    <span class="pl-k">if</span> (err) {</td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code js-file-line">      <span class="pl-en">console</span><span class="pl-c1">.error</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>failed to load diagram<span class="pl-pds">&#39;</span></span>);</td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code js-file-line">      <span class="pl-en">console</span><span class="pl-c1">.error</span>(err);</td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code js-file-line">      <span class="pl-k">return</span> <span class="pl-c1">log</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>failed to load diagram<span class="pl-pds">&#39;</span></span>, err);</td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code js-file-line">    }</td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code js-file-line">    <span class="pl-c">// diagram is loaded, add interaction to it</span></td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code js-file-line">    <span class="pl-c">// Option 1:</span></td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code js-file-line">    <span class="pl-c">// directly hook into internal diagram events</span></td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code js-file-line">    <span class="pl-c">// this allows you to access the clicked element directly</span></td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code js-file-line">    <span class="pl-k">var</span> eventBus <span class="pl-k">=</span> viewer.get(<span class="pl-s"><span class="pl-pds">&#39;</span>eventBus<span class="pl-pds">&#39;</span></span>);</td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code js-file-line">    <span class="pl-c">// you may hook into any of the following events</span></td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code js-file-line">    <span class="pl-k">var</span> events <span class="pl-k">=</span> [</td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code js-file-line">      <span class="pl-s"><span class="pl-pds">&#39;</span>element.hover<span class="pl-pds">&#39;</span></span>,</td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code js-file-line">      <span class="pl-s"><span class="pl-pds">&#39;</span>element.out<span class="pl-pds">&#39;</span></span>,</td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code js-file-line">      <span class="pl-s"><span class="pl-pds">&#39;</span>element.click<span class="pl-pds">&#39;</span></span>,</td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code js-file-line">      <span class="pl-s"><span class="pl-pds">&#39;</span>element.dblclick<span class="pl-pds">&#39;</span></span>,</td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code js-file-line">      <span class="pl-s"><span class="pl-pds">&#39;</span>element.mousedown<span class="pl-pds">&#39;</span></span>,</td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code js-file-line">      <span class="pl-s"><span class="pl-pds">&#39;</span>element.mouseup<span class="pl-pds">&#39;</span></span></td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code js-file-line">    ];</td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code js-file-line">    events.forEach(<span class="pl-k">function</span>(<span class="pl-smi">event</span>) {</td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code js-file-line">      eventBus.on(<span class="pl-c1">event</span>, <span class="pl-k">function</span>(<span class="pl-smi">e</span>) {</td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code js-file-line">        <span class="pl-c">// e.element = the model element</span></td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code js-file-line">        <span class="pl-c">// e.gfx = the graphical element</span></td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L60" class="blob-num js-line-number" data-line-number="60"></td>
        <td id="LC60" class="blob-code js-file-line">        <span class="pl-c1">log</span>(<span class="pl-c1">event</span>, <span class="pl-s"><span class="pl-pds">&#39;</span>on<span class="pl-pds">&#39;</span></span>, e.element.<span class="pl-c1">id</span>);</td>
      </tr>
      <tr>
        <td id="L61" class="blob-num js-line-number" data-line-number="61"></td>
        <td id="LC61" class="blob-code js-file-line">      });</td>
      </tr>
      <tr>
        <td id="L62" class="blob-num js-line-number" data-line-number="62"></td>
        <td id="LC62" class="blob-code js-file-line">    });</td>
      </tr>
      <tr>
        <td id="L63" class="blob-num js-line-number" data-line-number="63"></td>
        <td id="LC63" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L64" class="blob-num js-line-number" data-line-number="64"></td>
        <td id="LC64" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L65" class="blob-num js-line-number" data-line-number="65"></td>
        <td id="LC65" class="blob-code js-file-line">    <span class="pl-c">// Option 2:</span></td>
      </tr>
      <tr>
        <td id="L66" class="blob-num js-line-number" data-line-number="66"></td>
        <td id="LC66" class="blob-code js-file-line">    <span class="pl-c">// directly attach an event listener to an elements graphical representation</span></td>
      </tr>
      <tr>
        <td id="L67" class="blob-num js-line-number" data-line-number="67"></td>
        <td id="LC67" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L68" class="blob-num js-line-number" data-line-number="68"></td>
        <td id="LC68" class="blob-code js-file-line">    <span class="pl-c">// each model element a data-element-id attribute attached to it in HTML</span></td>
      </tr>
      <tr>
        <td id="L69" class="blob-num js-line-number" data-line-number="69"></td>
        <td id="LC69" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L70" class="blob-num js-line-number" data-line-number="70"></td>
        <td id="LC70" class="blob-code js-file-line">    <span class="pl-c">// select the end event</span></td>
      </tr>
      <tr>
        <td id="L71" class="blob-num js-line-number" data-line-number="71"></td>
        <td id="LC71" class="blob-code js-file-line">    <span class="pl-k">var</span> endEventNode <span class="pl-k">=</span> <span class="pl-c1">document</span>.querySelector(<span class="pl-s"><span class="pl-pds">&#39;</span>#js-canvas [data-element-id=END_EVENT]<span class="pl-pds">&#39;</span></span>);</td>
      </tr>
      <tr>
        <td id="L72" class="blob-num js-line-number" data-line-number="72"></td>
        <td id="LC72" class="blob-code js-file-line">    endEventNode.addEventListener(<span class="pl-s"><span class="pl-pds">&#39;</span>click<span class="pl-pds">&#39;</span></span>, <span class="pl-k">function</span>(<span class="pl-smi">e</span>) {</td>
      </tr>
      <tr>
        <td id="L73" class="blob-num js-line-number" data-line-number="73"></td>
        <td id="LC73" class="blob-code js-file-line">      <span class="pl-c1">alert</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>clicked the end event!<span class="pl-pds">&#39;</span></span>);</td>
      </tr>
      <tr>
        <td id="L74" class="blob-num js-line-number" data-line-number="74"></td>
        <td id="LC74" class="blob-code js-file-line">    });</td>
      </tr>
      <tr>
        <td id="L75" class="blob-num js-line-number" data-line-number="75"></td>
        <td id="LC75" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L76" class="blob-num js-line-number" data-line-number="76"></td>
        <td id="LC76" class="blob-code js-file-line">  });</td>
      </tr>
      <tr>
        <td id="L77" class="blob-num js-line-number" data-line-number="77"></td>
        <td id="LC77" class="blob-code js-file-line">
</td>
      </tr>
      <tr>
        <td id="L78" class="blob-num js-line-number" data-line-number="78"></td>
        <td id="LC78" class="blob-code js-file-line">})();</td>
      </tr>
</table>

  </div>

</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.03334s from github-fe116-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
    </ul>
  </div>
</div>


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-suggester-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="fullscreen-contents js-fullscreen-contents" placeholder=""></textarea>
      <div class="suggester-container">
        <div class="suggester fullscreen-suggester js-suggester js-navigation-container"></div>
      </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    
    

    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-x flash-close js-ajax-error-dismiss" aria-label="Dismiss error"></a>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-2c8ae50712a47d2b83d740cb875d55cdbbb3fdbccf303951cc6b7e63731e0c38.js"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-7e8b959d33fe342fbc6dc34ad18edaf6c283619cf2a73faf2083ec6f990c64fa.js"></script>
      
      

  </body>
</html>

