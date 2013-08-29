/* -*- Mode: C++; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

/*
** File: prmem.h
** Description: API to NSPR memory management functions
**
*/
#ifndef nsDummyPrmem_h__
#define nsDummyPrmem_h__

#include <stdlib.h>

inline void* PR_Malloc(size_t len)
{
    return malloc(len);
}

#define PR_FREEIF(p) if (p) free(p)

#endif