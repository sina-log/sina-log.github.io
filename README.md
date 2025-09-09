# James Blog

이곳은 James의 개인 블로그 소스 코드를 관리하는 저장소입니다.

[![Build and Deploy JBake Site](https://github.com/sina-log/sina-log.github.io/actions/workflows/deploy.yml/badge.svg)](https://github.com/sina-log/sina-log.github.io/actions/workflows/deploy.yml)

**👉 [블로그 바로가기](https://sina-log.github.io)**

## ✨ 소개

이 블로그는 정적 사이트 생성기인 [JBake](https://jbake.org/)를 사용하여 만들어졌으며, [GitHub Pages](https://pages.github.com/)를 통해 호스팅됩니다.

## 🚀 로컬에서 실행하고 글쓰기

블로그 글을 작성하거나 디자인을 수정하려면 로컬 환경에서 서버를 실행하여 변경사항을 미리 확인할 수 있습니다.

### 사전 준비

1.  **Java 설치**: JBake는 Java 기반이므로 JDK 8 이상이 설치되어 있어야 합니다.
2.  **JBake 설치**: [JBake 공식 문서](https://jbake.org/docs/2.6.7/#getting_started)를 참고하여 JBake를 설치합니다. (예: `sdk install jbake`)

### 개발 서버 실행

프로젝트의 루트 디렉토리(이 `README.md` 파일이 있는 곳)에서 아래 명령어를 실행하면 로컬 서버가 실행됩니다.

```bash
jbake -s
```

서버가 실행되면 웹 브라우저에서 `http://localhost:8820` 주소로 접속하여 실시간으로 변경되는 내용을 확인할 수 있습니다.

### 글 작성하기

새로운 글은 `content/blog/` 디렉토리 안에 마크다운(`.md`) 형식으로 작성합니다. 파일 상단에는 아래와 같은 헤더 정보를 포함해야 합니다.

```markdown
---
title: 새로운 글 제목
date: 2024-07-30
type: post
tags: java, spring
status: published
---

여기에 글 내용을 작성합니다...
```

## ⚙️ 배포

이 저장소는 **GitHub Actions**를 통해 배포가 자동화되어 있습니다.

1.  `source` 브랜치에 새로운 커밋을 `push`합니다.
2.  GitHub Actions가 자동으로 변경사항을 감지하여 사이트를 빌드합니다.
3.  빌드 결과물(정적 HTML 파일)을 `main` 브랜치에 배포합니다.
4.  잠시 후 `https://sina-log.github.io`에 변경사항이 반영됩니다.

따라서 블로그를 업데이트하려면 `source` 브랜치에 코드 변경사항을 `push`하기만 하면 됩니다.

## 📄 라이선스

이 프로젝트는 MIT License를 따릅니다.