<a id="readme-top"></a>


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/CoderUni/qack">
    <img src="docs/images/logo-circular.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Qack</h3>

  <p align="center">
    Go beyond textbooks. Qack makes English–Chinese learning smoother with natural, everyday translations.
    <br />
    <br />
    <a href="https://github.com/CoderUni/qack/issues/new">Supported Translators</a>
    &middot;
    <a href="https://github.com/CoderUni/qack/issues/new">Report an Issue</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#supported-translators">Supported Translators</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://hanstan.link)

Since Chinese is not my native language, I find it really hard to converse with the locals naturally. I always have to think twice about how to say something in Chinese, and often get misunderstood due to poor grammar and lack of vocabulary. 

This translator app utilizes various translation APIs to help me translate English phrases and sentences quickly while sounding natural at the same time. Most of the words learnt from HSK books are too formal and not used in daily conversations. Having many translators to choose from allows me to pick the one that suits my needs the best.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

A working environment for Flutter development and emulators installed. If you don't have them installed, you can follow the the official docs [here](https://docs.flutter.dev/get-started/install).

### Installation

_Additional setup steps are required to get the app up and running._

1. Clone the repo
   ```sh
   git clone https://github.com/CoderUni/qack.git
   ```
3. Install Flutter packages
   ```sh
   flutter pub get
   ```
4. Run the following build_runner code:
   ```sh
   dart run build_runner build
   ```
5. Configure [Sentry](https://sentry.io/welcome/) and paste the API key in the .env file
   Create a .env file inside the assets folder and add the following:
   ```js
   const SENTRY_LINK='ENTER YOUR API LINK';
   ```
6. Create an API Key from one or more of the [supported translators](#supported-translators) you'd like to use.
7. Run the app and paste the API Keys in the settings page.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORTED TRANSLATORS -->
## Supported Translators
- [x] Baidu
- [x] Deepseek
- [WIP] Youdao
- [] ChatGPT
- [] DeepL
- [] Google Translate

Support for ChatGPT, DeepL, and Google translate will be added soon. Through some testing,
I found that Chinese translation apps tend to perform better for English-Chinese translations
since they are built specifically for it. 

> LLMs such as Deepseek and ChatGPT tend to excel in smoothly translating slangs and daily converstaions.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

- [x] Multi-language Support
    - [x] English
    - [x] Chinese
    - [ ] Feel free to suggest more languages
- [ ] Support dictionaries other than Pleco
- [ ] Add example sentences in Dictionary
- [ ] Export to Anki

See the [open issues](https://github.com/CoderUni/qack/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Feedback and contributions are welcome! Feel free to check the [issues page](https://github.com/CoderUni/qack/issues) if you want to contribute. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the PolyForm Noncommercial License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Special thanks to the following resources and packages. This project could not be completed without them:

* [CC CEDICT](https://www.mdbg.net/chinese/dictionary?page=cedict)
* [Bloc](https://bloclibrary.dev)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
[product-screenshot]: images/screenshot.png