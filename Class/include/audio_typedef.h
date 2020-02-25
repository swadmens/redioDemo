/********************************************************************
*	File Name: 	        audio_typedef.h	
*	Author:             qiao gang
*	Copyright 1992-2013, ZheJiang Dahua Technology Stock Co.Ltd.
* 						All Rights Reserved
*	Description:��Ƶ���������Ͷ���ͷ�ļ�
*	Created:	        2013:04:23  09:39
*	Revision Record:    
*********************************************************************/

#ifndef _AUDIO_TYPEDEF_H
#define _AUDIO_TYPEDEF_H

typedef   signed char        WORD8;
typedef unsigned char       UWORD8;
typedef   signed short       WORD16;
typedef unsigned short      UWORD16;
typedef   signed int         WORD32;
typedef unsigned int        UWORD32;

#ifdef _WIN32
typedef   signed __int64     WORD64;
typedef unsigned __int64    UWORD64;
#define INLINE_T            __inline
#else
typedef   signed long long   WORD64;
typedef unsigned long long  UWORD64;
#define INLINE_T            inline
#endif

typedef void* Audio_Handle;

typedef struct /* ��Ƶ�������ݽṹ */
{
    void      *pData;    /* ��Ƶ������ʼ��ַ                     */
    WORD32     frequency;/* ����Ƶ�ʣ���λ��Hz                   */
    int        dataLen;  /* ���ݳ��ȣ���λ���ֽ�                 */
    int        depth;    /* �������(����)����λ��bit            */
    int        offset;   /* ������Ƶ������֮��ļ������λ���ֽ� */
    int        channels; /* ͨ����                               */
} AudioBuf;

#endif
